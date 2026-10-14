# Bài Lab 11 — MSSV 2A202602745

## Nội dung đã hoàn thành

- 10 TODO trong `lab11/`; 31 test TODO và 10 test đối chiếu Python–JavaScript đạt.
- Pipeline đầy đủ: world, replay, mc, hunt, estimate, fix, mine, export; không dùng `--quick` cho bằng chứng nộp.
- `REPORT.md` trả lời 9 câu, trích số từ bằng chứng; ảnh thật từ trình xem ở `evidence/shots/`.
- `hazard.json` là cảnh xe đạp dựng trong chương 10, quét 1.500 biến thể. Kết quả chỉ có điều kiện trên cảnh. `exposure=null` vì chưa có dữ liệu tần suất mỗi chuyến; đây là phần chưa đáp ứng đầy đủ rubric G, không coi bộ chạy chấp nhận file là đã đủ căn cứ exposure.

## Chạy lại

Dùng Python 3.9 trở lên. Trong thư mục dự án:

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python -m pytest -q tests/test_todos.py
sh run_submission.sh all
```

`run_submission.sh` dùng MSSV **nguyên vẹn** `2A202602745` qua `LAB11_MSSV`, đúng cơ chế bộ chạy hỗ trợ. Bộ chạy gốc chỉ chấp nhận chữ số khi đọc MSSV từ báo cáo, nên không gọi trực tiếp `run_all.py` mà thiếu biến này. Grader đã có cơ chế truyền MSSV từ roster. Không thay chữ A bằng số hay xóa chữ A: sẽ đổi seed và thị trấn.

Kiểm tra đối chiếu trình xem cần Node trong PATH:

```sh
.venv/bin/python -m pytest -q tests/test_parity.py
```

Không có Node thì nhóm test đó bị skip. Trên máy làm bài đã dùng Node đi kèm Codex và cả 10 test đạt.

## Xem trong 3D

Mở `viewer/index.html` bằng trình duyệt. Trong chương 9, chọn `evidence/viewer.json` (17 kịch bản, 6.000 điểm), rồi chọn B-01 hoặc C-01. B-01 tiếp xúc lúc 12,65 s, C-01 chặn lối lúc 21,4 s. Trong các run tìm dưới policy gốc, xe tô đặc là policy gốc; bóng mờ dùng policy cấp file `cutinLat=2.6`. Vì vậy cần đọc policy trong file, không suy chỉ từ nhãn bóng mờ chung của giao diện.

Trong chương 10, mở `hazard.json`; cảnh gốc tiếp xúc xe đạp H0 lúc 11,2 s. Không có thành tích tự lái được ghi vì chưa thử tự lái.

Để xem bản sửa là xe tô đặc và policy gốc là bóng mờ đúng yêu cầu bước E, nạp thêm `evidence/viewer-fix-comparison.json` ở chương 9, chọn B-01-FIX và tua tới 12,75 s. Đây là cùng kịch bản B-01, chỉ đổi vai hiển thị hai policy; không thay số liệu pipeline. Ảnh tương ứng là `evidence/shots/chosen-policy-baseline-ghost.jpg`.

## Các giới hạn cần giữ khi nộp

- Ước lượng IS của kiểu chưa thấy được báo bằng cận trên, không tuyên bố xác suất bằng 0.
- Khoảng chuẩn IS có thể thiếu độ phủ khi vài trọng số chi phối; báo cáo đã nêu rõ.
- Miền quét hazard có căn cứ hình học và gia tốc, chưa phải phân phối từ quan sát ngoài đời. `world=scene` được lab cho phép; không quy đổi nó sang xác suất mỗi chuyến thị trấn.
- Không chỉnh lõi mô phỏng, bộ chạy, tests, policy_candidates hoặc seed. Policy được chọn trên TRAIN, không chọn lại sau TEST.
