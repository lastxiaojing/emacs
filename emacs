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

;; 终端下鼠标可用
(xterm-mouse-mode t)

;; 主题设置
(load-theme 'monokai-alt t)
;; 主题设置结束

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

;; 使用y 代替yes  n 代替no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行列号
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)

;; 不用tab字符indent, 这回引起很多奇怪的错误。编辑Makefile时候不用担心，因为makefile-mode 会把tab键设置成真正的tab字符，并增加高亮显示
(setq-default indent-tabs-mode nil)
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

;; 绑定快捷键
;; 设置home键 指向buffer开头  end指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)


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
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("popkit" . "http://elpa.popkit.org/packages/"))))
 '(package-selected-packages
   (quote
    (company-ebdb company ubuntu-theme popwin popup-switcher popup-kill-ring popup-imenu popup-edit-menu popup-complete monokai-theme monokai-alt-theme idomenu ido-yes-or-no ido-vertical-mode ido-ubiquitous ido-springboard ido-sort-mtime ido-skk ido-select-window ido-occur ido-occasional ido-migemo ido-load-library ido-hacks ido-grid-mode ido-gnus ido-flex-with-migemo ido-exit-target ido-describe-bindings ido-complete-space-or-hyphen ido-clever-match ido-at-point go-snippets go-direx go-complete go-autocomplete go-add-tags go fuzzy-match fuzzy-format fuzzy el-swank-fuzzy darkokai-theme counsel-dash company-shell company-php company-go auto-complete-sage auto-complete-rst auto-complete-pcmp auto-complete-nxml auto-complete-exuberant-ctags auto-complete-distel auto-complete-clang-async auto-complete-clang auto-complete-c-headers auto-auto-indent ace-popup-menu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
