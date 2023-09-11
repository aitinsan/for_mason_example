class BasisResponseDto {
  int? pageNumber;
  int? pageSize;
  int? pageCount;
  int? recordsTotal;
  int? recordsFiltered;
  bool? succeeded;
  String? message;
  String? errors;
  int? statusCode;

  BasisResponseDto({
    this.pageNumber,
    this.pageSize,
    this.recordsTotal,
    this.recordsFiltered,
    this.succeeded,
    this.message,
    this.errors,
    this.pageCount,
    this.statusCode,
  });

  factory BasisResponseDto.fromJson(Map<String, dynamic> json) =>
      BasisResponseDto(
        pageNumber: json['pageNumber'] as int?,
        pageSize: json['pageSize'] as int?,
        recordsTotal: json['recordsTotal'] as int?,
        recordsFiltered: json['recordsFiltered'] as int?,
        succeeded: json['succeeded'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as String?,
        pageCount: json['pageCount'] as int?,
        statusCode: json['statusCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pageNumber': this.pageNumber,
        'pageSize': this.pageSize,
        'pageCount': this.pageCount,
        'recordsTotal': this.recordsTotal,
        'recordsFiltered': this.recordsFiltered,
        'succeeded': this.succeeded,
        'message': this.message,
        'errors': this.errors,
        'statusCode': this.statusCode,
      };
  bool get isError =>
      (succeeded != null && succeeded! == false && errors == null) == true;
}
