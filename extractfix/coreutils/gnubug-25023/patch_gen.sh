project_name=coreutils
bug_id=gnubug-25023
dir_name=$1/extractfix/$project_name/$bug_id

project_url=https://github.com/coreutils/coreutils.git
commit_id=ca99c52


current_dir=$PWD
mkdir -p $dir_name
cd $dir_name
git clone $project_url src
cd src
git checkout $commit_id

fix_file=src/pr.c
backup_file=backup.c

sed -i '1238i }' src/pr.c
sed -i '1236d' src/pr.c
sed -i '1236i else if (!join_lines && *col_sep_string == \x27\\t\x27 && lines_per_page == lines_per_body){' src/pr.c

diff -u $backup_file $fix_file > $2/$bug_id/cpr.patch
