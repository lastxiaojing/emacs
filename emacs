;; 语言环境字符设置

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)
;; 处理shell-mode乱码，好像没作用
;; 语言环境字符集设置结束

;;;;;;;;;;;;;;;; 绑定快捷键
;; 设置home键 指向buffer开头  end指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;; 设置Ctrl+j 跳转到指定行
(global-set-key (kbd "C-j") 'goto-line)
;; 设置Ctrl+> 切换窗口 终端下不可用
(global-set-key (kbd "C-.") 'other-window)
;;;;;;;;;;;;;;;; 绑定快捷键结束

;; 显示时间设置
(display-time-mode 1) ;; 启用时间显示设置，在minibuffer上边显示
(setq display-time-24hr-format t) ;; 24小时制
(setq display-time-day-and-date t) ;; 时间显示包括日期和具体时间
(setq display-time-use-mail-icon t) ;; 时间旁边启用邮件设置
(setq display-time-interval 10) ;; 时间的变化频率
;; 时间设置结束

;; 定制操作习惯
;;;;;;;; 设置打开文件的缺省路径
(setq default-derectory "~/")

;; 关闭错误提示声音
(setq visible-bell t)

;; 关闭emacs启动时画面
(setq inhibit-startup-message t)

;; 关闭gnus启动时候的画面
(setq gnus-inhibit-startup-message t)

;; 不要菜单栏
(setq menu-bar-mode nil)

;; 不要工具栏
(setq tool-bar-mode nil)

;; 使用y 代替yes  n 代替no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行列号
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)

;; 高亮当前行
(global-hl-line-mode 1)

;; 终端下鼠标可用
(xterm-mouse-mode t)

;; 主题设置
;; (load-theme 'monokai-alt t)
(load-theme 'tsdh-dark t)
;; 主题设置结束

;; 字体设置
(set-default-font "-*-Courier New-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
;; 字体设置结束


;; 不用tab字符indent, 这回引起很多奇怪的错误。编辑Makefile时候不用担心，因为makefile-mode 会把tab键设置成真正的tab字符，并增加高亮显示
;; (setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list())

;; 可以递归使用minibuffer
;; (setq enable-recursive-minibuffers t)

;; 防止页面滚动时候跳动,scroll-margin 3 可以在靠近屏幕边缘3行时开始滚动
(setq scroll-margin 3 scroll-conservatively 10000)

;; 打开括号匹配显示模式
(show-paren-mode t)

;; 括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处
(setq show-paren-style 'parenthesis)

;; 可以直接打开显示图片
(setq auto-image-file-mode t)

;; 进行语法加亮
(setq global-font-lock-mode t)

;; 不要备份文件
(setq make-backup-files nil)

;; 自动保存模式
(setq auto-save-mode nil)

;; 不生成临时文件
(setq-default make-backup-files nil)

;; 粘贴板
(setq x-select-enable-clipboard t)

;; 窗口移动


;;; 定制操作习惯结束

;;;;;; 方便变成操作设置
;; 代码折叠
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

;; 自动补全括号
;; 包括() "" {} []
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(
                              (?` ?` _"''")
                              (?\( ? _ ")")
                              (?\[ ? _ "]")
                              (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

;;;; ido 输入目录时候提示
(require 'ido)
(ido-mode t)

;;;; 自动弹出补全窗口
(require 'auto-complete-config)
(ac-config-default)
(auto-complete-mode t)
(require 'pos-tip)

;;;;; package 管理
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c92a0fece9ad256d83a0ce85df1f15e1c9280eba91c0cc06f8879b9572a855c7" "5f2ee0272ba16469ab93885879c7689a4fa9f57210f99869803db4343a703af0" default)))
 '(package-archives
   (quote
	(("gnu" . "http://elpa.gnu.org/packages/")
	 ("popkit" . "http://elpa.popkit.org/packages/"))))
 '(package-selected-packages
   (quote
	(electric-spacing flycheck ac-php-core company dash flx go-mode list-utils auto-complete company-c-headers flx-ido flymake-go ido-completing-read+ php-mode popup pos-tip yaxception swiper seq sage-shell-mode popwin popup-switcher popup-kill-ring popup-imenu popup-edit-menu popup-complete php+-mode monokai-theme monokai-alt-theme log4e idomenu ido-ubiquitous ido-springboard ido-sort-mtime ido-skk ido-select-window ido-occur ido-occasional ido-migemo ido-load-library ido-hacks ido-grid-mode ido-gnus ido-flex-with-migemo ido-exit-target ido-describe-bindings ido-complete-space-or-hyphen ido-clever-match ido-at-point go-snippets go-direx go-complete go-autocomplete go-add-tags go fuzzy-match fuzzy-format fuzzy flyspell-popup flyspell-lazy flyspell-correct-popup flyspell-correct-ivy flyspell-correct-helm flymake-php dash-functional company-shell company-php company-go auto-complete-exuberant-ctags auto-complete-c-headers auto-auto-indent ace-popup-menu ac-php))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
