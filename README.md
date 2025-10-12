# 📱 Mobile User Behavior Analysis & A/B Test

> 700명의 사용자 데이터 분석을 통한 배터리 효율 개선 및 Retention 전략

**기간**: 2025.10.03 ~ 2025.10.10 | **역할**: 개인 프로젝트

---

## 🎯 프로젝트 개요

Retention 개선을 위해 모바일 사용자 데이터를 탐색하던 중, 배터리 소모 패턴과 이탈의 연관성을 발견했습니다.

**배터리 효율**이라는 신규 지표를 개발하여 숨겨진 이탈 위험군을 식별하고,  
A/B 테스트로 개선 전략을 검증했습니다.

---

## 💡 핵심 성과

| 지표 | 결과 | 통계적 유의성 |
|------|------|---------------|
| 배터리 효율 개선 | **+18.7%** | p < 0.001 |
| Class 4→5 전환율 | **14.5%** | p = 0.0019 |
| 배터리 소모 감소 | **-20.0%** | p < 0.001 |

---

## 📊 주요 내용

1. **신규 지표 개발**: 배터리 1mAh당 사용 시간(초/mAh)으로 사용자 경험 품질 측정
2. **Cohort 세그먼테이션**: Low/Mid/High 3개 그룹으로 분류 (각 33%)
3. **A/B 테스트**: 2개 실험으로 개선 전략 검증 (모두 p < 0.01)

---

## 🛠 기술 스택

`Python` `Pandas` `Matplotlib` `Seaborn` `Scipy` `SQL (MySQL)`

---

## 📁 파일 구조

**분석 코드**
- `mobile_user_cohort_ab_test.ipynb` - 전체 분석 코드 (Python)

**데이터**
- `user_behavior_dataset.csv` - 원본 데이터 (700명)

**SQL 쿼리**
- `sql_queries/01_battery_efficiency_calculation.sql` - 배터리 효율 계산
- `sql_queries/02_cohort_segmentation.sql` - Cohort 세그먼트 분류
- `sql_queries/03_cohort_class_analysis.sql` - Cohort × Class 교차 분석

---

## 📚 데이터 출처

[Kaggle - Mobile Device Usage and User Behavior Dataset](https://www.kaggle.com/datasets/valakhorasani/mobile-device-usage-and-user-behavior-dataset)
