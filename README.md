# comment
## Instriction to disable get api.
there are 5000 comments from the api,
for testing the add comment feature you can disable the fetching from the api if you want,
head to `comment/lib/comment/comment_view_model.dart`
in the constructor body you can comment down `commentRepository.getComments()` and remove comments of `commentRepository.initialComment()`
Don't forget hot restart



