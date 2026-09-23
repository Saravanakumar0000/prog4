#!/bin/bash

# 1 & 2. Check SELinux status
getenforce
sestatus

# 3 & 5. Create web directory with permissions
mkdir -p /myweb
chmod 755 /myweb

# 4 & 6. Create index.html with permissions
touch /myweb/index.html
chmod 644 /myweb/index.html

# 8. Set wrong SELinux context
chcon -t default_t /myweb/index.html

# 7. List SELinux context
ls -Z /myweb/index.html

# 9. Search AVC log entries
ausearch -m AVC

# 10. Set correct SELinux context
chcon -t httpd_sys_content_t /myweb/index.html
