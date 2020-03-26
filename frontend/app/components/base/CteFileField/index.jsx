import React from 'react';
import PropTypes from 'prop-types';
import styles from './styles.module.scss';

const CteFileField = (props) => {
  const { className, fieldName, fileUrl, label, onSubmit } = props;

  const handleChange = (event) => {
    const file = event.target.files[0];
    const formData = new FormData();

    formData.append(`${className}[${fieldName}]`, file);

    onSubmit(formData);
  };

  return (
    <div className={`form-group file ${className}_${fieldName}`}>
      <label className="file" htmlFor={`${className}_${fieldName}`}>
        { label }
        <input
          accept="image/*"
          className={styles.fileInput}
          id={`${className}_${fieldName}`}
          name={`${className}[${fieldName}]`}
          onChange={handleChange}
          type="file"
        />
        <img className={styles.imageArea} src={fileUrl} alt="name"/>
      </label>
    </div>
  );
};

CteFileField.propTypes = {
  className: PropTypes.string.isRequired,
  fieldName: PropTypes.string.isRequired,
  fileUrl: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  onSubmit: PropTypes.func.isRequired,
};

export default CteFileField;
