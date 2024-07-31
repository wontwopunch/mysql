-- 1. 가장 오래 사용한 유저 5명 출력
select * from users
order by created_at
limit 5;

-- 2. 가장 회원가입을 많이 하는 요일
select 
	dayname(created_at) as day,
    count(*) as total
from users
group by day 
order by total desc
limit 2;

-- 3. 사진을 게시한 적 없는 비활성 유저 출력
select username from users
left join photos
	on users.id = photos.user_id
where photos.id is null;

-- 4. 좋아요 수가 가장 많은 사진
select
	username,
    photos.id,
    photos.image_url,
    count(*) as total
from photos
inner join likes
	on likes.photo_id = photos.id
inner join users
	on photos.user_id = users.id
group by photos.id
order by total desc
limit 1;

-- 5. 유저의 평균 게시글 작성
select (select count(*) from photos) / (select count(*) from users) as avg;

-- 6. 가장 많이 사용되는 해시태그 5개
select tags.tag_name, count(*) as total from photo_tags
	join tags
	on photo_tags.tag_id = tags.id
group by tags.id
order by total desc limit 5;