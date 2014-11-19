pathogen_dir="~/.vim/bundle"
plugins_dir="~/.vim/bundle-available"

if [ ! -d "$pathogen_dir" ]; then
  mkdir "$pathogen_dir"
fi

for i in `ls $plugins_dir`; do
  ln -s "$plugins_dir/$i" "$pathogen_dir/$i"
done
