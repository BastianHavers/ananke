EXTERNAL_INIT_COMMAND="./external/postgres/init_postgres"
INPUT_FILE="/home/common/cats_data/car_local/car_local"
SOURCES_NUMBER="1"
SOURCE_IP="localhost"
SOURCE_PORT=9999
DATASOURCE_COMMAND="java -cp %s io.palyvos.provenance.usecases.cars.local.CarLocalDataProvider -p ${SOURCE_PORT} -h ${SOURCE_IP} -f ${INPUT_FILE}"
queryReference="io.palyvos.provenance.usecases.cars.local.%s.queries.%s"
queries=(
"CarLocalQueries"
)
variants=(
"provenance"
"provenance"
"provenance"
"provenance"
"provenance"
"provenance"
"provenance"
"provenance"
"provenance"
)
# The suffixes for the experiment results folders
# Need to be in the same order as the variants array
variantAbbreviations=(
"ANK1"
"ANK-SL-0"
"ANK-SL-1000"
"ANK-SL-U-0"
"ANK-SL-U-1000"
"ANK-PG-0"
"ANK-PG-1000"
"ANK-PG-U-0"
"ANK-PG-U-1000"
)
variantExtraArgs=(
"--provenanceActivator ANANKE"
"--provenanceActivator ANANKE_SQLITE --pollFrequencyMillis 0"
"--provenanceActivator ANANKE_SQLITE --pollFrequencyMillis 1000"
"--provenanceActivator ANANKE_SQLITE --uniqueDbKeys --pollFrequencyMillis 0"
"--provenanceActivator ANANKE_SQLITE --uniqueDbKeys --pollFrequencyMillis 1000"
"--provenanceActivator ANANKE_POSTGRES --pollFrequencyMillis 0"
"--provenanceActivator ANANKE_POSTGRES --pollFrequencyMillis 1000"
"--provenanceActivator ANANKE_POSTGRES --uniqueDbKeys --pollFrequencyMillis 0"
"--provenanceActivator ANANKE_POSTGRES --uniqueDbKeys --pollFrequencyMillis 1000"
)
EXPERIMENT_ARGS="--aggregateStrategy sortedPtr --sourceIP ${SOURCE_IP} --sourcePort ${SOURCE_PORT}"
