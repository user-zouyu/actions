export container_name="$1"
export image_name="$2"

echo "container_name: $container_name"
echo "image_name: $image_name"

export container_id=$(docker ps -aq --filter name="$container_name")
if [ "$container_id" != ""  ]; then
  echo "remove docker container, name: $container_name ID: $container_id"
  docker rm -f "$container_id"
fi

export image_id=$(docker images -aq --filter "reference=*/$image_name:v*.*.*")
if [ "$image_id" != ""  ]; then
  echo "remove docker image, name: $image_name ID: $image_id"
  docker rmi -f $(docker images -aq --filter "reference=*/$image_name:v*.*.*")
fi