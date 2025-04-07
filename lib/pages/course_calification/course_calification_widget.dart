import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'course_calification_model.dart';
export 'course_calification_model.dart';

class CourseCalificationWidget extends StatefulWidget {
  const CourseCalificationWidget({super.key});

  @override
  State<CourseCalificationWidget> createState() =>
      _CourseCalificationWidgetState();
}

class _CourseCalificationWidgetState extends State<CourseCalificationWidget> {
  late CourseCalificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseCalificationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          safeSetState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).warning,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= 3.0,
      unratedColor: FlutterFlowTheme.of(context).alternate,
      itemCount: 5,
      itemSize: 16.0,
      glowColor: FlutterFlowTheme.of(context).warning,
    );
  }
}
