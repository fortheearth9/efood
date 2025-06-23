
# $body1 = @{
#     category_name = "New category"
#     category_id = "CAT123"
# } | ConvertTo-Json

# Invoke-WebRequest -Uri "http://localhost:3000/table_category" -Method Post -Body $body1 -ContentType "application/json"


# $body2 = @{
#     category_name = "UPDATED_NAME"
# } | ConvertTo-Json

# Invoke-WebRequest -Uri "http://localhost:3000/table_category/10" -Method Put -Body $body2 -ContentType "application/json"


# Invoke-WebRequest -Uri "http://localhost:3000/table_category/10" -Method Delete



# $body3 = @{
#     category_id = "CAT123"
# } | ConvertTo-Json

# Invoke-WebRequest -Uri "http://localhost:3000/table_category" -Method Delete -Body $body3 -ContentType "application/json"

   Invoke-WebRequest -Uri "http://localhost:3000/table_category_all" -Method Get