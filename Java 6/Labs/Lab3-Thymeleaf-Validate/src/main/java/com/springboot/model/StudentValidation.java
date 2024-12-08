package com.springboot.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudentValidation {
	@NotEmpty(message = "Email không được trống")
    @Email(message = "Định dạng email không hợp lệ")
    private String email;

    @NotEmpty(message = "Họ và tên không được trống")
    private String fullName;

    @NotNull(message = "Điểm không được trống")
    @PositiveOrZero(message = "Điểm phải lớn hơn hoặc bằng 0")
    @Max(value = 10, message = "Điểm phải nhỏ hơn hoặc bằng 10")
    private Double marks;

    @NotNull(message = "Giới tính không được trống")
    private boolean gender;

    @NotEmpty(message = "Quốc gia không được trống")
    private String country;
}
