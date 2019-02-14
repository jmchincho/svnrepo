docker volume create svn-root
docker run -dit --name svn-server -v svn-root:/home/svn -p 7443:80 -p 3960:3960 -w /home/svn elleflorio/svn-server
docker exec -t svn-server htpasswd -b /etc/subversion/passwd svnadmin abcd1234
docker exec -it svn-server svnadmin create Test
docker exec -it svn-server sh -c "chmod 777 -R Test"
svn co http://localhost:7443/svn/Test
cd Test
svn add --force .
svn commit -m "fisrt commit"