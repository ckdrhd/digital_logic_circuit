# HW3 - 래치와 플립플롭 (VHDL + Logisim-evolution 게이트 수준 구현)

디지털논리회로설계 과제: 다섯 가지 순차 회로를 개별 게이트로 만든 Logisim 회로와 VHDL로 각각 구현하고 동작을 비교합니다.

| 문제 | 내용 | VHDL | Logisim | 게이트 구성 |
|---|---|---|---|---|
| 1 | RS 래치 | `p1_rs_latch.vhd` | `p1_rs_latch.circ` | NOR 2 |
| 2 | D 래치 (enable) | `p2_d_latch.vhd` | `p2_d_latch.circ` | NAND 4 |
| 3 | 상승 에지 D 플립플롭 | `p3_d_flipflop.vhd` | `p3_d_flipflop.circ` | D 래치 2 (NAND 8) + NOT 1 |
| 4 | 상승 에지 JK 플립플롭 | `p4_jk_flipflop.vhd` | `p4_jk_flipflop.circ` | NAND 13 |
| 5 | 비동기 Set/Clear D 플립플롭 (Clear 우선) | `p5_dff_async.vhd` | `p5_dff_async.circ` | NAND 8 |

| 기타 | 설명 |
|---|---|
| `report.pdf` | 보고서 (코드, 설명, 회로도, 시뮬레이션 결과) |
| `tb/` | Questa 테스트벤치 |
| `questa_log.txt` | 테스트벤치 실행 결과 (모두 Errors: 0, Warnings: 0) |
| `schematics/` | VHDL 설계의 Questa Schematic 창 캡처 |
| `waveforms/` | Questa 파형 |
| `screenshots/` | Logisim 동작 조건별 회로 상태 |

Logisim에서 파일을 처음 열면 피드백 회로의 값이 정해지지 않아 Q가 오류(빨간색)로 표시됩니다. 문제 1은 R=1, 문제 2는 en=1, 문제 3은 CLK를 1로 올린 뒤 0으로 내리고, 문제 4는 K=1에서 클럭을 한 번 주고, 문제 5는 clr=1로 초기화한 뒤 시험합니다.
