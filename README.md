# 📱 Mobile Behavior Analysis
개인 프로젝트 | 2025.10.03~2025.10.11

## 🎯 프로젝트 개요
모바일 사용 데이터셋을 기반으로 사용자 행동 패턴을 분석하고,  
이탈(Churn) 및 집중 사용자의 특징을 도출한 개인 분석 프로젝트입니다.

## 📊 주요 내용
- **EDA (탐색적 데이터 분석)** : 앱 사용 시간, 배터리 소모량, 데이터 사용량 간 상관관계 분석  
- **Feature Correlation Heatmap**: 0.93~0.98 강한 양의 상관관계 확인  
- **User Segmentation**: 고사용군 vs 저사용군 군집화  

## 💡 인사이트
- 모바일 핵심 지표들이 하나의 행동 클러스터를 형성  
- 특정 행동 그룹의 이탈 확률이 2.3배 높음  
- 스크린온 시간과 배터리 소모량이 가장 강한 예측 변수  

## 🛠️ 사용 기술
`Python`, `Pandas`, `Matplotlib`, `Seaborn`, `Scikit-learn`

## 📎 파일 구성
| 파일명 | 설명 |
|--------|------|
| Mobile_project_20251011.ipynb | 분석 전체 코드 |
| user_behavior_dataset.csv | 원본 데이터셋 |
