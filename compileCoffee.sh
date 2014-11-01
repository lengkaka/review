#ls *.coffee | awk '{print $0}' | xargs coffee
cmd=`find . -type f -name "*.coffee" | sudo xargs coffee -c`
echo $cmd
