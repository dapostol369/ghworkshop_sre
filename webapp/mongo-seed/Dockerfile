FROM mongo
COPY product.json /product.json
#RUN mongo ghc --eval "db.dropDatabase()"
CMD mongoimport --host mongo --db ghc --collection product --type json --file /product.json --jsonArray
