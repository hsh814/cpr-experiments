project_name=coreutils
bug_id=bugzilla-26545
dir_name=$1/extractfix/$project_name/$bug_id

project_url=https://github.com/coreutils/coreutils.git
commit_id=8d34b45

current_dir=$PWD
mkdir -p $dir_name
cd $dir_name
git clone $project_url src
cd src
git checkout $commit_id

fix_file=src/shred.c
backup_file=backup.c

sed -i '290d' src/shred.c
sed -i '290i for(i = 3; (bits < r); i *= 2)' src/shred.c

diff -u $backup_file $fix_file > $2/$bug_id/cpr.patch
