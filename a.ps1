Invoke-WebRequest -Uri "http://localhost:3000/food" -Method Get

Invoke-WebRequest -Uri "http://localhost:3000//table_category/2" -Method Get

$body = @{
    category_name = "New category"
    category_id = "CAT123"
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:3000//table_category" -Method Post -Body $body -ContentType "application/json"


$body2 = @{
    category_name = "UPDATED_NAME"
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:3000/table_category/10" -Method Put -Body $body2 -ContentType "application/json"


$body3 = @{
    category_name = "CAT123"
} | ConvertTo-Json
Invoke-WebRequest -Uri "http://localhost:3000/table_category/" -Method Delete
