FROM mongo
COPY product.json /product.json
CMD mongoimport --host mongo --db ghc --collection product --type json --file /product.json --jsonArray
