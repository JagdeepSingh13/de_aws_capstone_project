select
    date_part('year', fs.session_start_time) as session_year,
    da.artist_name,
    sum(fs.price) as total_sales
from {{var("target_schema")}}.fact_session fs 
left join {{var("target_schema")}}.dim_artists da 
    on fs.artist_id = da.artist_id
group by 1,2