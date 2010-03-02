# .bashrc
RCS=~/.bash/rc.d/ 
FILES=$(find $RCS -type f)

for f in $FILES; do
  source $f
done

export EC2_HOME='/opt/aws/ec2-api-tools'
export AWS_ELB_HOME='/opt/aws/elb-api-tools'
export AWS_RDS_HOME='/opt/aws/rds-tools'

export PATH=$PATH:$EC2_HOME/bin:$AWS_ELB_HOME/bin:$AWS_RDS_HOME/bin
export PATH=$PATH:~/.gem/ruby/1.8/bin

if [[ -s /home/gmarik/.rvm/scripts/rvm ]] ; then source /home/gmarik/.rvm/scripts/rvm ; fi
