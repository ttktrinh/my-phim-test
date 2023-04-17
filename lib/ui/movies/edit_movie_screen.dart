import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/movie.dart';
import '../shared/dialog_utils.dart';
import 'movies_manager.dart';

class EditMovieScreen extends StatefulWidget {
  static const routeName = '/edit-movie';

  EditMovieScreen(
    Movie? movie, {
    super.key,
  }) {
    if (movie == null) {
      this.movie = Movie(
        id: null,
        name: '',
        description: '',
        nation: '',
        genre: '',
        posterUrl: '',
        watchUrl: '',
        year: DateTime.now().year.toInt(),
      );
    } else {
      this.movie = movie;
    }
  }

  late final Movie movie;

  @override
  State<EditMovieScreen> createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Movie _editedMovie;
  var _isLoading = false;

  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith(' .jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        // Ảnh hợp lệ --> Vẽ lại màn hình để hiện preview
        setState(() {});
      }
    });
    _editedMovie = widget.movie;
    _imageUrlController.text = _editedMovie.posterUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.movie.id == null
            ? const Text('Add Movie')
            : const Text('Edit Movie'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    buildPosterPreview(),
                    buildNameField(),
                    buildYearField(),
                    buildNationField(),
                    buildGenreField(),
                    buildPosterURLField(),
                    buildWatchURLField(),
                    buildDescriptionField(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedMovie.name,
      decoration: const InputDecoration(labelText: 'Movie\'s name'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a movie\'s name.';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(name: value);
      },
    );
  }

  TextFormField buildNationField() {
    return TextFormField(
      initialValue: _editedMovie.nation,
      decoration: const InputDecoration(labelText: 'Nation'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a movie\'s nation.';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(nation: value);
      },
    );
  }

  TextFormField buildGenreField() {
    return TextFormField(
      initialValue: _editedMovie.genre,
      decoration: const InputDecoration(labelText: 'Genre'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a movie\'s genre.';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(genre: value);
      },
    );
  }

  TextFormField buildYearField() {
    return TextFormField(
      initialValue: _editedMovie.year.toString(),
      decoration: const InputDecoration(labelText: 'Release year'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide movie\'s release year.';
        }
        final n = num.tryParse(value);
        if (n == null) {
          return '"$value" is not a valid year';
        }
        if (n < 1900 || n > 2100) {
          return '"$value" is a invalid number';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(year: int.parse(value.toString()));
      },
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedMovie.description,
      decoration: const InputDecoration(labelText: 'Discription'),
      maxLines: 15,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a description.';
        }
        if (value.length < 10) {
          return 'Should be at least 10 characters long.';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(description: value);
      },
    );
  }

  Widget buildPosterPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
              ? const Center(
                  child: Text(
                    'Poster Preview',
                    textAlign: TextAlign.center,
                  ),
                )
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        // Expanded(child: buildImageURLField()),
      ],
    );
  }

  TextFormField buildPosterURLField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Poster Image URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.next,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an image URL.';
        }
        if (!_isValidImageUrl(value)) {
          return 'Please enter a valid image URL.';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(posterUrl: value);
      },
    );
  }

  TextFormField buildWatchURLField() {
    return TextFormField(
      initialValue: _editedMovie.watchUrl,
      decoration: const InputDecoration(labelText: 'Watch URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an video URL.';
        }
        return null;
      },
      onSaved: (value) {
        _editedMovie = _editedMovie.copyWith(watchUrl: value);
      },
    );
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try {
      final moviesManager = context.read<MoviesManager>();
      if (_editedMovie.id != null) {
        moviesManager.updateMovie(_editedMovie);
      } else {
        moviesManager.addMovie(_editedMovie);
      }
    } catch (error) {
      await showErrorDialog(context, 'Something went wrong.');
    }

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
