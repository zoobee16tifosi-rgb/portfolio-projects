-- 쿼리 3: Cohort 및 Class별 개선 가능성 분석
-- 목적: 각 세그먼트의 현재 상태와 개선 목표 제시

USE mobile_usage;

SELECT 
    efficiency_cohort,
    user_behavior_class,
    COUNT(*) AS user_count,
    ROUND(AVG(app_usage_time), 1) AS avg_app_usage_time,
    ROUND(AVG(battery_drain), 1) AS avg_battery_drain,
    ROUND(AVG(battery_efficiency), 2) AS avg_battery_efficiency,
    -- 개선 가능성 지표
    ROUND(AVG(number_of_apps), 1) AS avg_apps_to_optimize,
    CONCAT(
        ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM user_behavior_dataset), 1), 
        '%'
    ) AS percentage_of_total
FROM (
    SELECT 
        `User ID`,
        `App Usage Time (min/day)` AS app_usage_time,
        `Battery Drain (mAh/day)` AS battery_drain,
        `Number of Apps Installed` AS number_of_apps,
        `User Behavior Class` AS user_behavior_class,
        ROUND(
            `App Usage Time (min/day)` * 60.0 / NULLIF(`Battery Drain (mAh/day)`, 0), 
            2
        ) AS battery_efficiency,
        CASE 
            WHEN ROUND(`App Usage Time (min/day)` * 60.0 / NULLIF(`Battery Drain (mAh/day)`, 0), 2) < 8.2 
                THEN 'Low'
            WHEN ROUND(`App Usage Time (min/day)` * 60.0 / NULLIF(`Battery Drain (mAh/day)`, 0), 2) BETWEEN 8.2 AND 12.1 
                THEN 'Mid'
            ELSE 'High'
        END AS efficiency_cohort
    FROM user_behavior_dataset
    WHERE `Battery Drain (mAh/day)` > 0 
      AND `App Usage Time (min/day)` > 0
) AS analysis_data
GROUP BY efficiency_cohort, user_behavior_class
ORDER BY 
    CASE efficiency_cohort
        WHEN 'Low' THEN 1
        WHEN 'Mid' THEN 2
        WHEN 'High' THEN 3
    END,
    user_behavior_class;