-- Databricks notebook source
-- MAGIC 
-- MAGIC %run ./Common

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC 
-- MAGIC # SETUP
-- MAGIC 
-- MAGIC # Coding Challenge Setup
-- MAGIC # Always declare here any variables or functions created for the candidate
-- MAGIC from pyspark.sql.types import StructType
-- MAGIC 
-- MAGIC 
-- MAGIC def setup():
-- MAGIC   from pyspark.sql.types import StringType
-- MAGIC   from pyspark.sql.types import IntegerType
-- MAGIC   from pyspark.sql.functions import abs, col
-- MAGIC   
-- MAGIC   dfA = (createDummyData("joins1a", seed="a")
-- MAGIC           .withColumn("transactionId", col("index"))
-- MAGIC           .withColumn("itemName", col("name").cast(StringType()))
-- MAGIC           .withColumn("itemId", col("id"))
-- MAGIC           .drop("Name", "ID", "index", "Password", "Percent", "YesNo", "UTCTime", "Probability", "Amount" )
-- MAGIC            .createOrReplaceTempView("purchases"))
-- MAGIC   
-- MAGIC   dfB = (createDummyData("joins1b", seed="a")
-- MAGIC           .withColumn("itemId", col("id"))
-- MAGIC           .withColumn("value", col("Amount"))
-- MAGIC           .drop("Name", "ID", "index", "Password", "Percent", "YesNo", "UTCTime", "Probability", "Amount" )
-- MAGIC           .createOrReplaceTempView("prices"))
-- MAGIC   
-- MAGIC   return(dfA, dfB)
-- MAGIC 
-- MAGIC 
-- MAGIC setup()
-- MAGIC 
-- MAGIC displayHTML("""
-- MAGIC Declared the following tables:
-- MAGIC   <li><span style="color:green; font-weight:bold">purchases</span> </li>
-- MAGIC   <li><span style="color:green; font-weight:bold">prices</span> </li>  
-- MAGIC """)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC 
-- MAGIC 
-- MAGIC # SETUP
-- MAGIC 
-- MAGIC # Coding Challenge Setup
-- MAGIC from pyspark.sql.types import StructType
-- MAGIC 
-- MAGIC def setup() -> (DataFrame, DataFrame):
-- MAGIC   (spark.createDataFrame([
-- MAGIC   (     "Excepteur Aute", 175592,          "fK7MYqtKVf", 54.56,   False),
-- MAGIC   (       "Aliqua Minim", 968504, "qI2a5pyV12PecVX2tFE", 64.60,   True),
-- MAGIC   (  "Excepteur Officia", 951040,     "IKEuSqnwQvm5PY3", 3.47,   True),
-- MAGIC   (      "Aliqua Dolore", 182464,        "TKA8zpq7yIfH", 3.52,   False),
-- MAGIC   (     "Excepteur Enim", 217000,        "PIrHip77dC1D", 23.73,   False),
-- MAGIC   (             "Ut Sit", 710872,          "bGoVHoCIAZ", 10.77,   True),
-- MAGIC   ("Excepteur Voluptate", 375848,   "2Iypco1iZQIqinMku", 7.64,   True),
-- MAGIC   (       "Excepteur Ut", 326012,      "9EcCvnKsmhYz8f", 4.89,   True),
-- MAGIC   (            "Ut Sint", 291040,        "LEZQSnN5I4PB", 14.93,   True),
-- MAGIC   (         "Excepteur ", 598656, "mGljpnEVgxncz3cUvKL", 43.81,   True),
-- MAGIC   (          "Ut Dolore", 459227,   "yGfyOoHgEKeo4LRCv", 35.85,   False),
-- MAGIC   (       "Pariatur Qui", 262143,         "wUJlZvpQp93", 91.72,   True)
-- MAGIC   ], ["itemName", "discountId", "discountCode", "price", "active"]).createOrReplaceTempView("discounts"))
-- MAGIC 
-- MAGIC   (spark.createDataFrame([
-- MAGIC   ("Pariatur Incididunt", 76589, 473),
-- MAGIC   (          "Aliqua Ea", 67697, 323),
-- MAGIC   (       "Aliqua Minim", 21837, 190),
-- MAGIC   (  "Excepteur Officia", 12881, 89),
-- MAGIC   (      "Aliqua Dolore", 26631, 2199),
-- MAGIC   (     "Excepteur Enim", 29337, 325),
-- MAGIC   (             "Ut Sit", 23081, 131),
-- MAGIC   ("Excepteur Voluptate", 32861, 178),
-- MAGIC   (          "Aliqua Id", 83723, 362),
-- MAGIC   (       "Excepteur Ut", 29923, 1920),
-- MAGIC   (            "Ut Sint", 40948, 381),
-- MAGIC   (          "Ut Dolore", 80123, 93)
-- MAGIC   ], ["itemName", "itemId", "amount"]).createOrReplaceTempView("products"))
-- MAGIC 
-- MAGIC setup()
-- MAGIC 
-- MAGIC displayHTML("""
-- MAGIC Declared the following tables:
-- MAGIC   <li><span style="color:green; font-weight:bold">discounts</span> </li>
-- MAGIC   <li><span style="color:green; font-weight:bold">products</span> </li>  
-- MAGIC """)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC 
-- MAGIC # SETUP
-- MAGIC 
-- MAGIC # Coding Challenge Setup
-- MAGIC # Always declare here any variables or functions created for the candidate
-- MAGIC from pyspark.sql.types import StructType
-- MAGIC 
-- MAGIC def setup():
-- MAGIC   (spark.createDataFrame([
-- MAGIC   (     "Excepteur Aute", 172),
-- MAGIC   (      "Aliqua Dolore", 164),
-- MAGIC   (         "Excepteur ", 556),
-- MAGIC   (       "Pariatur Qui", 213)
-- MAGIC   ], ["storeName", "storeId"]).createOrReplaceTempView("stores"))
-- MAGIC 
-- MAGIC   (spark.createDataFrame([
-- MAGIC   ("Pariatur Incididunt", 76589, 473),
-- MAGIC   (          "Aliqua Ea", 67697, 323),
-- MAGIC   (       "Aliqua Minim", 21837, 190),
-- MAGIC   (  "Excepteur Officia", 12881, 89),
-- MAGIC   (      "Aliqua Dolore", 26631, 2199),
-- MAGIC   (             "Ut Sit", 23081, 131)
-- MAGIC   ], ["itemName", "itemId", "amount"]).createOrReplaceTempView("articles"))
-- MAGIC  
-- MAGIC setup()
-- MAGIC 
-- MAGIC displayHTML("""
-- MAGIC Declared the following tables: 
-- MAGIC   <li><span style="color:green; font-weight:bold">stores</span> </li>
-- MAGIC   <li><span style="color:green; font-weight:bold">articles</span> </li> 
-- MAGIC """)
