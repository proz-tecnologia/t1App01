class Contato {
  final String nome;
  final String email;
  final String profissao;

  Contato({
    required this.nome,
    required this.email,
    required this.profissao,
  });
}

class BlogPost {
  final int userId;
  final int id;
  final String title;
  final String body;

  BlogPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

final blogPostList = [
  BlogPost(
    userId: 1,
    id: 1,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  ),
  BlogPost(
    userId: 1,
    id: 2,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  ),
  BlogPost(
    userId: 1,
    id: 3,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit sauhsuahhusuhsahshuahushuashsuhauhsuhas",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  ),
  BlogPost(
    userId: 1,
    id: 4,
    title:
        "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body:
        "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
  ),
];
