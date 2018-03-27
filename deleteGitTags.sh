echo "regex to search for the git tags: $1"
git tag --list | grep $1 > tag_list_to_delete
echo "starting the loop"
for i in `cat tag_list_to_delete`
do
	echo "Deleting the git tag locally: $i"
	git tag --delete "$i"
	echo "Deleting the remote git tag: $i"	
	git push --delete origin "$i"
	echo "deleted git tag: $i"
done
