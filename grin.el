(defvar grin-hist nil)

(defvar grind-hist nil)

(defvar grind-find-hist nil)

(defgroup grin nil
  "Run grin and grind (python replacements for grep and find) putting hits in a grep buffer."
  :group 'tools
  :group 'processes)

(defcustom grin-cmd "grin --emacs"
  "The grin command."
  :type 'string
  :group 'grin)

(defcustom grind-cmd "grind"
  "The grind command."
  :type 'string
  :group 'grin)

(defun grin ()
  (interactive)
  (let* ((c (concat grin-cmd " \"\""))
         (l (length c))
         (cmd (read-shell-command "Command: " (cons c l) 'grin-hist))
         (null-device nil))
    (grep cmd)))

(defun grind ()
  (interactive)
  (let* ((c (concat grind-cmd " \"\""))
         (l (length c))
         (args (read-shell-command "Command: " (cons c l) 'grind-hist))
         (cmd (concat args " | sed s/$/\\:1\\:/"))
         (null-device nil))
    (grep cmd)))

(defun grind-find ()
  (interactive)
  (let* ((c "find . -name \"CVS\" -prune -o -name \"RCS\" -prune -o -name \".svn\" -prune -o -name \".hg\" -prune -o -name \".bzr\" -prune -o -name \".git\" -o -name \"build\" -prune -o -name \"dist\" -prune -o -name \"*.pyc\" -prune -o -name \"*.pyo\" -prune -o -name \"*.so\" -prune -o -name \"*.o\" -prune -o -name \"*.a\" -prune -o -name \"*.tgz\" -prune -o -name \"*.tar.gz\" -prune -o -name \"*.rar\" -prune -o -name \"*.zip\" -prune -o -name \"*~\" -prune -o -name \"#\" -prune -o -name \"*.bak\" -prune -o -name \"*.png\" -prune -o -name \"*.jpg\" -prune -o -name \"*.gif\" -prune -o -name \"*.bmp\" -prune -o -name \"*.tif\" -prune -o -name \"*.tiff\" -prune -o -name \"*.pyd\" -prune -o -name \"*.dll\" -prune -o -name \"*.exe\" -prune -o -name \"*.obj\" -prune -o -name \"*.lib\" -prune -o -iname \"\" -print")
         (l (- (length c) 7))
         (args (read-shell-command "Command: " (cons c l) 'grind-find-hist))
         (cmd (concat args " | sed s/$/\\:1\\:/"))
         (null-device nil))
    (grep cmd)))

(provide 'grin)
