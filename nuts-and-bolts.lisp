(in-package :academy)

(defun asdf-system-base-path (system-name)
  "Return the root directory of asdf system named NAME."
  (directory-namestring (asdf:component-pathname (asdf:find-system system-name))))

(defun data-path (name &key (verify t) (subdirectory "data"))
  "Return the path to the data file named NAME. If VERIFY is T, the existence of
this file is verified."
  (let ((path (format nil "~A~A/~A" (asdf-system-base-path :academy) subdirectory name)))
    (when (and verify (not (probe-file path)))
      (error "No data file named ~S found." path))
    path))