FROM google/cloud-sdk:alpine

RUN apk --no-cache add jq

COPY run.sh run.sh
RUN chmod +x run.sh

CMD ["./run.sh"]