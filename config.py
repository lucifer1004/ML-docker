c = get_config()

# 所有matplotlib的图像都通过iline的方式显示
c.IPKernelApp.pylab = 'inline'
# 这一行指向我们刚刚创建的ssl证书
c.NotebookApp.certfile = './mycert.pem'
# 给出刚刚创建的密码的哈希值
c.NotebookApp.password = 'sha1:b443380803d1:d57b93914df5a23d03a48254d801d497e2b8e945'
c.NotebookApp.ip = '*'
#  给出运行的端口，ipython默认为8888
c.NotebookApp.port = 8888
#  禁止在运行ipython的同时弹出浏览器
c.NotebookApp.open_browser = False