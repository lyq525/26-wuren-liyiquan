mkdir -p linux_practice/name
mkdir -p linux_practice/permission
touch linux_practice/name/file1.txt
touch linux_practice/name/file2.txt
touch linux_practice/permission/file3.txt
touch linux_practice/permission/file4.txt
rm linux_practice/name/file1.txt
mv linux_practice/name/file2.txt linux_practice/name/show.txt
echo "Hello linux" > linux_practice/name/show.txt
cat linux_practice/name/show.txt
chmod 644 linux_practice/permission/file*.txt
echo "Changed permissions for file3.txt to -rw-r--r--"
echo "Changed permissions for file4.txt to -rw-r--r--"
