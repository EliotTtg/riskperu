import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/users_record.dart';
import 'schema/examenes_record.dart';
import 'schema/preguntas_record.dart';
import 'schema/resultados_record.dart';
import 'schema/courses_record.dart';
import 'schema/category_courses_record.dart';
import 'schema/plans_record.dart';
import 'schema/module_record.dart';
import 'schema/module_class_record.dart';
import 'schema/users_moduleclass_record.dart';
import 'schema/language_record.dart';
import 'schema/features_record.dart';
import 'schema/users_courses_record.dart';
import 'schema/users_answers_record.dart';
import 'schema/respuestas_record.dart';
import 'schema/actions_record.dart';
import 'schema/users_plans_record.dart';
import 'schema/comentarios_record.dart';
import 'schema/notas_record.dart';
import 'schema/announcements_courses_record.dart';
import 'schema/announcement_comments_record.dart';
import 'schema/detalles_resultados_record.dart';
import 'schema/certificates_record.dart';
import 'schema/pasarela_pagos_record.dart';
import 'schema/courses_pasarela_record.dart';
import 'schema/session_record.dart';
import 'schema/qualification_record.dart';
import 'schema/respuesta_state_record.dart';
import 'schema/exam_groups_record.dart';
import 'schema/register_simulator_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'schema/examenes_record.dart';
export 'schema/preguntas_record.dart';
export 'schema/resultados_record.dart';
export 'schema/courses_record.dart';
export 'schema/category_courses_record.dart';
export 'schema/plans_record.dart';
export 'schema/module_record.dart';
export 'schema/module_class_record.dart';
export 'schema/users_moduleclass_record.dart';
export 'schema/language_record.dart';
export 'schema/features_record.dart';
export 'schema/users_courses_record.dart';
export 'schema/users_answers_record.dart';
export 'schema/respuestas_record.dart';
export 'schema/actions_record.dart';
export 'schema/users_plans_record.dart';
export 'schema/comentarios_record.dart';
export 'schema/notas_record.dart';
export 'schema/announcements_courses_record.dart';
export 'schema/announcement_comments_record.dart';
export 'schema/detalles_resultados_record.dart';
export 'schema/certificates_record.dart';
export 'schema/pasarela_pagos_record.dart';
export 'schema/courses_pasarela_record.dart';
export 'schema/session_record.dart';
export 'schema/qualification_record.dart';
export 'schema/respuesta_state_record.dart';
export 'schema/exam_groups_record.dart';
export 'schema/register_simulator_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ExamenesRecords (as a Stream and as a Future).
Future<int> queryExamenesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ExamenesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ExamenesRecord>> queryExamenesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ExamenesRecord.collection,
      ExamenesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ExamenesRecord>> queryExamenesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ExamenesRecord.collection,
      ExamenesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PreguntasRecords (as a Stream and as a Future).
Future<int> queryPreguntasRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PreguntasRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PreguntasRecord>> queryPreguntasRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PreguntasRecord.collection,
      PreguntasRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PreguntasRecord>> queryPreguntasRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PreguntasRecord.collection,
      PreguntasRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ResultadosRecords (as a Stream and as a Future).
Future<int> queryResultadosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ResultadosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ResultadosRecord>> queryResultadosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ResultadosRecord.collection,
      ResultadosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ResultadosRecord>> queryResultadosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ResultadosRecord.collection,
      ResultadosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CoursesRecords (as a Stream and as a Future).
Future<int> queryCoursesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CoursesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CoursesRecord>> queryCoursesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CoursesRecord.collection,
      CoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CoursesRecord>> queryCoursesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CoursesRecord.collection,
      CoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CategoryCoursesRecords (as a Stream and as a Future).
Future<int> queryCategoryCoursesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CategoryCoursesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CategoryCoursesRecord>> queryCategoryCoursesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CategoryCoursesRecord.collection,
      CategoryCoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CategoryCoursesRecord>> queryCategoryCoursesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CategoryCoursesRecord.collection,
      CategoryCoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PlansRecords (as a Stream and as a Future).
Future<int> queryPlansRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PlansRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PlansRecord>> queryPlansRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PlansRecord.collection,
      PlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PlansRecord>> queryPlansRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PlansRecord.collection,
      PlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ModuleRecords (as a Stream and as a Future).
Future<int> queryModuleRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ModuleRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ModuleRecord>> queryModuleRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ModuleRecord.collection,
      ModuleRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ModuleRecord>> queryModuleRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ModuleRecord.collection,
      ModuleRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ModuleClassRecords (as a Stream and as a Future).
Future<int> queryModuleClassRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ModuleClassRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ModuleClassRecord>> queryModuleClassRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ModuleClassRecord.collection,
      ModuleClassRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ModuleClassRecord>> queryModuleClassRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ModuleClassRecord.collection,
      ModuleClassRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UsersModuleclassRecords (as a Stream and as a Future).
Future<int> queryUsersModuleclassRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersModuleclassRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersModuleclassRecord>> queryUsersModuleclassRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersModuleclassRecord.collection,
      UsersModuleclassRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersModuleclassRecord>> queryUsersModuleclassRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersModuleclassRecord.collection,
      UsersModuleclassRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query LanguageRecords (as a Stream and as a Future).
Future<int> queryLanguageRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      LanguageRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<LanguageRecord>> queryLanguageRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      LanguageRecord.collection,
      LanguageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<LanguageRecord>> queryLanguageRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      LanguageRecord.collection,
      LanguageRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query FeaturesRecords (as a Stream and as a Future).
Future<int> queryFeaturesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      FeaturesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<FeaturesRecord>> queryFeaturesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      FeaturesRecord.collection,
      FeaturesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<FeaturesRecord>> queryFeaturesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      FeaturesRecord.collection,
      FeaturesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UsersCoursesRecords (as a Stream and as a Future).
Future<int> queryUsersCoursesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersCoursesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersCoursesRecord>> queryUsersCoursesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersCoursesRecord.collection,
      UsersCoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersCoursesRecord>> queryUsersCoursesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersCoursesRecord.collection,
      UsersCoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UsersAnswersRecords (as a Stream and as a Future).
Future<int> queryUsersAnswersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersAnswersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersAnswersRecord>> queryUsersAnswersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersAnswersRecord.collection,
      UsersAnswersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersAnswersRecord>> queryUsersAnswersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersAnswersRecord.collection,
      UsersAnswersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RespuestasRecords (as a Stream and as a Future).
Future<int> queryRespuestasRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RespuestasRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RespuestasRecord>> queryRespuestasRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RespuestasRecord.collection,
      RespuestasRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RespuestasRecord>> queryRespuestasRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RespuestasRecord.collection,
      RespuestasRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ActionsRecords (as a Stream and as a Future).
Future<int> queryActionsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ActionsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ActionsRecord>> queryActionsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ActionsRecord.collection,
      ActionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ActionsRecord>> queryActionsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ActionsRecord.collection,
      ActionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query UsersPlansRecords (as a Stream and as a Future).
Future<int> queryUsersPlansRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersPlansRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersPlansRecord>> queryUsersPlansRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersPlansRecord.collection,
      UsersPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersPlansRecord>> queryUsersPlansRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersPlansRecord.collection,
      UsersPlansRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ComentariosRecords (as a Stream and as a Future).
Future<int> queryComentariosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ComentariosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ComentariosRecord>> queryComentariosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ComentariosRecord.collection,
      ComentariosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ComentariosRecord>> queryComentariosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ComentariosRecord.collection,
      ComentariosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query NotasRecords (as a Stream and as a Future).
Future<int> queryNotasRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      NotasRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<NotasRecord>> queryNotasRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      NotasRecord.collection,
      NotasRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<NotasRecord>> queryNotasRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      NotasRecord.collection,
      NotasRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AnnouncementsCoursesRecords (as a Stream and as a Future).
Future<int> queryAnnouncementsCoursesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AnnouncementsCoursesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AnnouncementsCoursesRecord>> queryAnnouncementsCoursesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AnnouncementsCoursesRecord.collection,
      AnnouncementsCoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AnnouncementsCoursesRecord>> queryAnnouncementsCoursesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AnnouncementsCoursesRecord.collection,
      AnnouncementsCoursesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AnnouncementCommentsRecords (as a Stream and as a Future).
Future<int> queryAnnouncementCommentsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AnnouncementCommentsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AnnouncementCommentsRecord>> queryAnnouncementCommentsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AnnouncementCommentsRecord.collection,
      AnnouncementCommentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AnnouncementCommentsRecord>> queryAnnouncementCommentsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AnnouncementCommentsRecord.collection,
      AnnouncementCommentsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query DetallesResultadosRecords (as a Stream and as a Future).
Future<int> queryDetallesResultadosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      DetallesResultadosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<DetallesResultadosRecord>> queryDetallesResultadosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DetallesResultadosRecord.collection,
      DetallesResultadosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DetallesResultadosRecord>> queryDetallesResultadosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DetallesResultadosRecord.collection,
      DetallesResultadosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CertificatesRecords (as a Stream and as a Future).
Future<int> queryCertificatesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CertificatesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CertificatesRecord>> queryCertificatesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CertificatesRecord.collection,
      CertificatesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CertificatesRecord>> queryCertificatesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CertificatesRecord.collection,
      CertificatesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query PasarelaPagosRecords (as a Stream and as a Future).
Future<int> queryPasarelaPagosRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      PasarelaPagosRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<PasarelaPagosRecord>> queryPasarelaPagosRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      PasarelaPagosRecord.collection,
      PasarelaPagosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<PasarelaPagosRecord>> queryPasarelaPagosRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      PasarelaPagosRecord.collection,
      PasarelaPagosRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CoursesPasarelaRecords (as a Stream and as a Future).
Future<int> queryCoursesPasarelaRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CoursesPasarelaRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CoursesPasarelaRecord>> queryCoursesPasarelaRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CoursesPasarelaRecord.collection,
      CoursesPasarelaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CoursesPasarelaRecord>> queryCoursesPasarelaRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CoursesPasarelaRecord.collection,
      CoursesPasarelaRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SessionRecords (as a Stream and as a Future).
Future<int> querySessionRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SessionRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SessionRecord>> querySessionRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SessionRecord.collection,
      SessionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SessionRecord>> querySessionRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SessionRecord.collection,
      SessionRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query QualificationRecords (as a Stream and as a Future).
Future<int> queryQualificationRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      QualificationRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<QualificationRecord>> queryQualificationRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      QualificationRecord.collection,
      QualificationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<QualificationRecord>> queryQualificationRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      QualificationRecord.collection,
      QualificationRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RespuestaStateRecords (as a Stream and as a Future).
Future<int> queryRespuestaStateRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RespuestaStateRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RespuestaStateRecord>> queryRespuestaStateRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RespuestaStateRecord.collection,
      RespuestaStateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RespuestaStateRecord>> queryRespuestaStateRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RespuestaStateRecord.collection,
      RespuestaStateRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ExamGroupsRecords (as a Stream and as a Future).
Future<int> queryExamGroupsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ExamGroupsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ExamGroupsRecord>> queryExamGroupsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ExamGroupsRecord.collection,
      ExamGroupsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ExamGroupsRecord>> queryExamGroupsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ExamGroupsRecord.collection,
      ExamGroupsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query RegisterSimulatorRecords (as a Stream and as a Future).
Future<int> queryRegisterSimulatorRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      RegisterSimulatorRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<RegisterSimulatorRecord>> queryRegisterSimulatorRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      RegisterSimulatorRecord.collection,
      RegisterSimulatorRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<RegisterSimulatorRecord>> queryRegisterSimulatorRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      RegisterSimulatorRecord.collection,
      RegisterSimulatorRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}
