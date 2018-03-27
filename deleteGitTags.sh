#!/bin/bash
echo "regex to search for the git tags: $tagRegex"
git tag --list | grep $tagRegex > tag_list_to_delete
echo "list of git tags to be deleted: "
cat tag_list_to_delete
echo "starting the loop to delete the above list......................"
for i in `cat tag_list_to_delete`
do
	echo "Deleting the git tag locally: $i"
	git tag --delete "$i"
	echo "Deleting the remote git tag: $i"	
	git push --delete origin "$i"
	echo "deleted git tag: $i"
done
