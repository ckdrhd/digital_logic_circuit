# HW2 - VHDL_1 Problems 1~5 (VHDL + Logisim-evolution)

디지털논리회로설계 과제: 강의자료 VHDL_1의 1.4 Problems 다섯 문제를 VHDL로 작성하고 Logisim-evolution에서 시뮬레이션합니다.

| 문제 | 내용 | VHDL | Logisim |
|---|---|---|---|
| 1 | 4입력 AND / OR (`out1`, `out2`) | `p1_logic.vhd` | `p1_logic.circ` |
| 2 | 8-to-1 멀티플렉서 | `p2_mux8_1.vhd` | `p2_mux8_1.circ` |
| 3 | 7세그먼트에 문자 A b C d F g 표시 (en=0 → Hi-Z) | `p3_led_letter.vhd` | `p3_led_letter.circ` |
| 4 | 25인 투표기 (13표 이상이면 1) | `p4_vote25.vhd` | `p4_vote25.circ` |
| 5 | 13비트 입력의 1 개수를 7세그먼트에 표시 (0~9, A~F, en=0 → 꺼짐) | `p5_count_ones.vhd` | `p5_count_ones.circ` |

| 기타 | 설명 |
|---|---|
| `report.pdf` | 보고서 (코드, 설명, 회로, 시뮬레이션 결과) |
| `tb/` | Questa 확인용 테스트벤치 |
| `questa_log.txt` | 테스트벤치 실행 결과 (모두 Errors: 0, Warnings: 0) |
| `screenshots/` | Logisim 시뮬레이션 스크린샷 |

7세그먼트 출력 `display(7 downto 0)`의 비트 순서는 a b c d e f g dp입니다.
