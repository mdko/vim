vim
===

To use the plugins, create a symbolic link from plugin in the
'bundle-available' folder to the 'bundle' folder, like:

    ln -s ~/.vim/bundle-available/srcexpl ~/.vim/bundle

Pathogen will do the rest.

Note: for trinity, it seems that I need to have both the srcexpl
and taglist plugins installed (but not the NERDTree plugin, since the
trinity plugin already has an edited NERDTree plugin file). And
by installed, I mean their folders symbolically linked to the
'bundle' folder where Pathogen looks.

Use ':Helptags' to generate the help file for the plugins.
