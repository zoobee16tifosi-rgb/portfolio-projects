-- 쿼리 2: Cohort 분류 및 세그먼트별 집계 (서브쿼리 버전)
USE mobile_usage;

SELECT 
    efficiency_cohort,
    ROUND(AVG(app_usage_time), 1) AS avg_app_usage_time,
    ROUND(AVG(battery_drain), 1) AS avg_battery_drain,
    ROUND(AVG(number_of_apps), 1) AS avg_number_of_apps,
    ROUND(AVG(screen_on_time), 1) AS avg_screen_on_time,
    ROUND(AVG(battery_efficiency), 2) AS avg_battery_efficiency
FROM (
    SELECT 
        `App Usage Time (min/day)` AS app_usage_time,
        `Battery Drain (mAh/day)` AS battery_drain,
        `Number of Apps Installed` AS number_of_apps,
        `Screen On Time (hours/day)` AS screen_on_time,
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
) AS cohort_data
GROUP BY efficiency_cohort
ORDER BY 
    CASE efficiency_cohort
        WHEN 'Low' THEN 1
        WHEN 'Mid' THEN 2
        WHEN 'High' THEN 3
    END;