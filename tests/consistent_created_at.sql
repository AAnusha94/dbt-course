SELECT r.review_date,l.created_at 
FROM {{ ref('fct_reviews') }} r
LEFT JOIN {{ ref('dim_listings_cleansed') }} l
    ON l.listing_id = r.listing_id
WHERE r.review_date < l.created_at
limit 10