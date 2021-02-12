create or replace pipe LANDING.MARKETING_ANALYTICS.PIPE_FRANKLIN_MILLS_HOLDOUT AUTO_INGEST=TRUE
as

COPY INTO LANDING.MARKETING_ANALYTICS.FRANKLIN_ABANDONED_TRIGGER_HOLDOUT
FROM

(select $1, $2, $3,$4,$5,$6,$7,$8,$9, METADATA$FILENAME AS FILENAME, TO_TIMESTAMP_TZ(CURRENT_TIMESTAMP()) as DB_LOAD_TMSTP 
from @PARTY.LANDING.PROD_S3STAGE/franklin_mills_mail_files/holdout/)



                                        FILE_FORMAT = (TYPE = 'CSV'
                                                    FIELD_DELIMITER = ','
                                                    SKIP_HEADER = 1
                                                    DATE_FORMAT = AUTO
                                                    FIELD_OPTIONALLY_ENCLOSED_BY ='"')

                                        --FORCE = TRUE
                                        ON_ERROR = CONTINUE;

