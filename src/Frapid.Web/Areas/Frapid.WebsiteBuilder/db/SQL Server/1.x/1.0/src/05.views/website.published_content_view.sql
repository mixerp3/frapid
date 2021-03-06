IF OBJECT_ID('website.published_content_view') IS NOT NULL
DROP VIEW website.published_content_view;
GO
CREATE VIEW website.published_content_view
AS
SELECT
    website.contents.content_id,
    website.contents.category_id,
    website.categories.category_name,
    website.categories.alias AS category_alias,
    website.contents.title,
    website.contents.alias,
    website.contents.author_id,
    account.users.name AS author_name,
    website.contents.markdown,
    website.contents.publish_on,
    CASE WHEN website.contents.last_edited_on IS NULL THEN website.contents.publish_on ELSE website.contents.last_edited_on END AS last_edited_on,
    website.contents.contents,
    website.contents.tags,
    website.contents.seo_description,
    website.contents.is_homepage,
    website.categories.is_blog
FROM website.contents
INNER JOIN website.categories
ON website.categories.category_id = website.contents.category_id
LEFT JOIN account.users
ON website.contents.author_id = account.users.user_id
WHERE is_draft = 0
AND publish_on <= getutcdate()
AND website.contents.deleted = 0;


GO
