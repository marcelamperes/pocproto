#!/bin/sh

if [ -z $LANGUAGE ]
then
  LANGUAGE='ruby'
fi

if [ $LANGUAGE = 'objc' ]
then
  PLUGIN='grpc_objective_c_plugin'
elif [ $LANGUAGE = 'java' ]
then
  PLUGIN='protoc-gen-grpc-java'
else
  PLUGIN="grpc_${LANGUAGE}_plugin"
fi

OUTPUT="pb-${LANGUAGE}"

FLAGS="--${LANGUAGE}_out=${OUTPUT} --grpc_out=${OUTPUT}"
FLAGS="${FLAGS} --plugin=protoc-gen-grpc=/usr/bin/${PLUGIN}"

if [ $LANGUAGE = 'objc' ]
then
  FLAGS="${FLAGS} --objc_opt=generate_for_named_framework=B2Beauty-ProtoRPC"
fi

mkdir -p $OUTPUT
for file in $(find service -type f -name '*.proto')
do
  protoc $FLAGS $file
done

# This source is need because objective-c generates wrong imports in some files |:
if [ $LANGUAGE = 'objc' ]
then
  for file in $(find $OUTPUT -type f -name '*.pbrpc.*')
  do
    mv $file $file.bak
    sed -E 's!#import "service/.*/([A-Za-z0-9_-]+\.pb.*)"!#import <B2Beauty-ProtoRPC/\1>!' $file.bak > $file
    rm $file.bak
  done
fi
