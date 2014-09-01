# sshd
#

FROM     centos:centos6

RUN yum update -y

RUN yum -y install openssh openssh-server openssh-clients
RUN service sshd start; service sshd stop
RUN sed -i '/pam_loginuid\.so/s/required/optional/' /etc/pam.d/sshd


ADD . /src/
RUN rm /src/*~ ; true

EXPOSE 22
CMD ["/src/startup.sh"]
