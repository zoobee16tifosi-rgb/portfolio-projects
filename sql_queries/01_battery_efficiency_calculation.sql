-- 데이터베이스 선택
USE mobile_usage;

-- 쿼리 1: 사용자별 배터리 효율 계산
SELECT 
    `User ID` AS user_id,
    `App Usage Time (min/day)` AS app_usage_time,
    `Battery Drain (mAh/day)` AS battery_drain,
    `Number of Apps Installed` AS number_of_apps,
    `Screen On Time (hours/day)` AS screen_on_time,
    `Data Usage (MB/day)` AS data_usage,
    `User Behavior Class` AS user_behavior_class,
    ROUND(
        `App Usage Time (min/day)` * 60.0 / NULLIF(`Battery Drain (mAh/day)`, 0), 
        2
    ) AS battery_efficiency
FROM user_behavior_dataset
WHERE `Battery Drain (mAh/day)` > 0 
  AND `App Usage Time (min/day)` > 0
ORDER BY `User ID`;