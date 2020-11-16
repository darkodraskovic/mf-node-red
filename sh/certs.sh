# ./certs.sh -k 0e2a00e6-81f7-4918-9653-f76c372c535f -h ashvin00.mainflux.io -d ~/Downloads

while getopts ":k:h:d:" opt; do
    case $opt in
        k)
            KEY=$OPTARG
            ;;
        h)
            HOST=$OPTARG
            ;;
        d)
            DEST=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $(basename $0) [-k] [-h] [-d]"
            ;;        
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if [ -z "$KEY" ]
then
    echo "ERROR: Thing key not specified."
    exit 1
fi

if [ -z "$HOST" ]
then
    HOST=localhost
fi

if [ -z "$DEST" ]
then
    DEST=`pwd`
fi

cd $GOPATH/src/github.com/mainflux/mainflux/docker/ssl
make ca CN=$HOST
make server_cert CN=$HOST
make thing_cert THING_KEY=$KEY

cp -r certs $DEST
