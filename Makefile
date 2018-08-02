all: runtime sdk

runtime:	
	docker build \
	--build-arg DOTNET_BUNDLE=https://download.microsoft.com/download/1/f/7/1f7755c5-934d-4638-b89f-1f4ffa5afe89/dotnet-runtime-2.1.2-linux-arm.tar.gz \
	-t richbayliss/armv7hf-debian-dotnet-runtime:2.1 \
	.

sdk:
	docker build \
	--build-arg DOTNET_BUNDLE=https://download.microsoft.com/download/4/0/9/40920432-3302-47a8-b13c-bbc4848ad114/dotnet-sdk-2.1.302-linux-arm.tar.gz \
	-t richbayliss/armv7hf-debian-dotnet-sdk:2.1 \
	.
