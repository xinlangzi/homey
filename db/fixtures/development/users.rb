encrypted_password = "$2a$10$g6Z/OBsOqN044f2YtH6qTOJPJVm7FPKzA2mOGh/Tcp0nd89X1mfnu"
User.seed(:name,
  { name: "Member", role: 0, email: 'member@example.com', encrypted_password: encrypted_password },
  { name: "VIP", role: 1, email: 'vip@example.com', encrypted_password: encrypted_password  },
  { name: "Customer Service", role: 3, email: 'cs@example.com', encrypted_password: encrypted_password }
)
User.all.map(&:confirm!)