package com.example.taskmanager.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tasks")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotBlank(message = "Title is required")
    @Size(max = 100, message = "Title must be less than 100 characters")    
    private String title;

    private String description;

    private Boolean completed;
    private LocalDateTime createdAt;

    @PrePersist
    public void prePersist() {
        if (completed == null) completed = false;
        if (createdAt == null) createdAt = LocalDateTime.now();
    }
}