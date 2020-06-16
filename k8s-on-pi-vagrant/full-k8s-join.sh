vagrant scp master:/tmp/joincluster.sh .
chmod 755 joincluster.sh
vagrant scp joincluster.sh worker1:/tmp/
vagrant scp joincluster.sh worker2:/tmp/
vagrant scp joincluster.sh worker3:/tmp/
vagrant scp joincluster.sh worker4:/tmp/
vagrant ssh master --command "kubectl get nodes"
vagrant ssh worker1 --command "sudo /tmp/joincluster.sh"
vagrant ssh worker2 --command "sudo /tmp/joincluster.sh"
vagrant ssh worker3 --command "sudo /tmp/joincluster.sh"
vagrant ssh worker4 --command "sudo /tmp/joincluster.sh"
vagrant ssh master --command "kubectl get nodes"
