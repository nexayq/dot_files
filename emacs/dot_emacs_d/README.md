
# Setup Emacs
    Copy "SW_Ubuntu/02m_Text_Editors/02e_Emacs/dot_emacs_d" 
    into "~/.emacs.d"

# Config
    Put "init.el" into "~/.emacs.d/init.el"

# Install packages
    Add melpa repositories by running script "install_packages.el" inside Emacs:
        $ emacs
            C-x C-f ~/.emacs.d/install_packages_24.el
            M-x eval-buffer
                ; M-x -> Esc-x
                ; if space doesn't work use 'Esc-space'
        Restart Emacs
