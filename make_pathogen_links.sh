# Some fiddling might need to be done with these paths, perhaps non-relative
pathogen_dir="~/.vim/bundle"
plugins_dir="~/.vim/bundle-available"
current_bundles="current-bundles-used"

if [ ! -d "$pathogen_dir" ]; then
  mkdir "$pathogen_dir"
fi

while read plugin; do
  ln -s "$plugins_dir/$plugin" "$pathogen_dir/$plugin"
done < $current_bundles
