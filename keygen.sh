existing=($(find ./secrets/ -maxdepth 1 -name "*-old.pem"))
if [ ${#existing[@]} -gt 0 ]; then
	read -p "Old certs detected, remove them to proceed? (y/N)" proceed;
	if ! [[ "$proceed" == "y" ]]; then
		exit 1;
	else
		rm ./secrets/*-old.pem;
	fi
fi

echo "Marking existing keys as old";
for file in ./secrets/*; do
	mv "$file" "${file%.pem}-old.pem";
done

read -p "Hostname(idptestbed): " hostname;
hostname=${hostname:-idptestbed};

echo "Creating new keys for $hostname";
docker run\
	--rm\
	-v $(pwd)/secrets:/app\
	-u $(id -u):$(id -g)\
	unicon/shibboleth-sp\
	/etc/shibboleth/keygen.sh\
		-o /app\
		-y 3\
		-h $hostname\
		-e https://$hostname/shibboelth;

echo "Adjusting key file permissions";
chmod ugo+r secrets/sp-cert.pem;
chmod ugo+r secrets/sp-key.pem;